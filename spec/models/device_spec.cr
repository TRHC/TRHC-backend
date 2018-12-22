require "./spec_helper"
require "../../src/models/device.cr"

describe Device do
  Spec.before_each do
    Repo.delete_all(Device)
  end
end
