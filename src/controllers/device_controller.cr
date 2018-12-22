class DeviceController < ApplicationController
  def new
    uuid = UUID.random
    d = Device.new
    d.uuid = uuid.to_s
    d.name = params[:name]
    d.user_id = @u.as(User).id

    Repo.insert(d)
  end


  def devices
    respond_with do
      json(Repo.all(Device, Query.where(user_id: @u.as(User).id)).to_json)
    end
  end

  def delete_device
    Repo.delete_all(Device, Query.where(uuid: params[:uuid], user_id: @u.as(User).id))
  end
end