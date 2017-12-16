require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encounter = encounters(:one)
  end

  test "should get index" do
    get encounters_url, as: :json
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post encounters_url, params: { encounter: { assessment: @encounter.assessment, meetdate: @encounter.meetdate, patientname: @encounter.patientname, workername: @encounter.workername } }, as: :json
    end

    assert_response 201
  end

  test "should show encounter" do
    get encounter_url(@encounter), as: :json
    assert_response :success
  end

  test "should update encounter" do
    patch encounter_url(@encounter), params: { encounter: { assessment: @encounter.assessment, meetdate: @encounter.meetdate, patientname: @encounter.patientname, workername: @encounter.workername } }, as: :json
    assert_response 200
  end

  test "should destroy encounter" do
    assert_difference('Encounter.count', -1) do
      delete encounter_url(@encounter), as: :json
    end

    assert_response 204
  end
end
