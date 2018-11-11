require "./spec_helper"
require "../../src/models/record.cr"

describe Record do
  Spec.before_each do
    Repo.delete_all(Record)
  end
end
