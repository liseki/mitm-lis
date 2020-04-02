require File.dirname(__FILE__) + '/../test_helper'
require 'mitm_licensing_search_controller'

# Re-raise errors caught by the controller.
class MitmLicensingSearchController; def rescue_action(e) raise e end; end

class MitmLicensingSearchControllerTest < Test::Unit::TestCase
  def setup
    @controller = MitmLicensingSearchController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
