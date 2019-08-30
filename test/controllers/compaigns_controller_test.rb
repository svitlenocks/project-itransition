require 'test_helper'

class CompaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compaign = compaigns(:one)
  end

  test "should get index" do
    get compaigns_url
    assert_response :success
  end

  test "should get new" do
    get new_compaign_url
    assert_response :success
  end

  test "should create compaign" do
    assert_difference('Compaign.count') do
      post compaigns_url, params: { compaign: { description: @compaign.description, endtime: @compaign.endtime, goal: @compaign.goal, title: @compaign.title, user_id: @compaign.user_id, video: @compaign.video } }
    end

    assert_redirected_to compaign_url(Compaign.last)
  end

  test "should show compaign" do
    get compaign_url(@compaign)
    assert_response :success
  end

  test "should get edit" do
    get edit_compaign_url(@compaign)
    assert_response :success
  end

  test "should update compaign" do
    patch compaign_url(@compaign), params: { compaign: { description: @compaign.description, endtime: @compaign.endtime, goal: @compaign.goal, title: @compaign.title, user_id: @compaign.user_id, video: @compaign.video } }
    assert_redirected_to compaign_url(@compaign)
  end

  test "should destroy compaign" do
    assert_difference('Compaign.count', -1) do
      delete compaign_url(@compaign)
    end

    assert_redirected_to compaigns_url
  end
end
