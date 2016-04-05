require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :shared_locations }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :country }
  end
end
