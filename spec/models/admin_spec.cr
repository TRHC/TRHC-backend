require "./spec_helper"
require "../../src/models/admin.cr"

describe Admin do
  Spec.before_each do
    Repo.delete_all(Admin)
  end
end
