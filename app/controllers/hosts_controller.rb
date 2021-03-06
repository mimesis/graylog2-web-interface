class HostsController < ApplicationController
  filter_access_to :index
  filter_access_to :destroy
  filter_access_to :show
  filter_access_to :quickjump
  
  def index
    @hosts = Host.all :order => "message_count DESC"
    @hostgroups = Hostgroup.all

    @hosts_and_groups = @hosts | @hostgroups

    @host_count = Host.count
  end

  def show
    @has_sidebar = true
    @load_flot = true
    
    @host = Host.find_by_host Base64.decode64(params[:id])
    @messages = Message.all_of_host @host.host, params[:page]
    @total_count = @host.message_count

    if @host.blank?
      flash[:error] = "Could not find host!"
      redirect_to :action => "index"
    end

    @last_message = Message.last :conditions => { "host" => @host.host }, :order => "created_at DESC"
  end

  def destroy
    host = Host.find_by_host Base64.decode64(params[:id])
    if host.blank?
      flash[:error] = "Could not delete host!"
      redirect_to :action => "index"
      return
    end

    # Delete all messages of thist host.
    begin
      Message.delete_all_of_host host.host
    rescue => e
      flash[:error] = "Could not delete messages of host"
      redirect_to :action => "index"
      return
    end

    # Delete host.
    if host.destroy
      flash[:notice] = "Host has been deleted"
    else
      flash[:error] = "Could not delete host"
      redirect_to :action => "index"
      return
    end

    redirect_to :action => "index"
  end

  def quickjump
    @host = Host.find_by_host params[:host].strip

    if @host.blank?
      flash[:error] = "Unknown host"
      redirect_to :action => "index"
    else
      redirect_to :action => "show", :id => Base64.encode64(params[:host].strip)
    end
  end
end
