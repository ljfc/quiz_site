require 'test_helper'

class ResponseTest < ActiveSupport::TestCase

  # Sanity check: make sure a valid record saves.
  def test_factory_saves
    response = FactoryGirl.create(:response)
    assert response.save, "Saved the default FactoryGirl response object"
  end

end
