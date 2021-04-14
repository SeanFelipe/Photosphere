class Spec < ApplicationRecord
  has_many :test_executions, dependent: :destroy
end
