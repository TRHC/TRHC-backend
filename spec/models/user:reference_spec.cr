require "./spec_helper"
require "../../src/models/user:reference.cr"

describe User:reference do
  Spec.before_each do
    Repo.delete_all(User:reference)
  end
end
