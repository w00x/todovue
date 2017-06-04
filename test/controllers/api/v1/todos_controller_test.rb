require 'test_helper'

class Api::V1::TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_todo = api_v1_todos(:one)
  end

  test "should get index" do
    get api_v1_todos_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_todo_url
    assert_response :success
  end

  test "should create api_v1_todo" do
    assert_difference('Api::V1::Todo.count') do
      post api_v1_todos_url, params: { api_v1_todo: { description: @api_v1_todo.description, success: @api_v1_todo.success } }
    end

    assert_redirected_to api_v1_todo_url(Api::V1::Todo.last)
  end

  test "should show api_v1_todo" do
    get api_v1_todo_url(@api_v1_todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_todo_url(@api_v1_todo)
    assert_response :success
  end

  test "should update api_v1_todo" do
    patch api_v1_todo_url(@api_v1_todo), params: { api_v1_todo: { description: @api_v1_todo.description, success: @api_v1_todo.success } }
    assert_redirected_to api_v1_todo_url(@api_v1_todo)
  end

  test "should destroy api_v1_todo" do
    assert_difference('Api::V1::Todo.count', -1) do
      delete api_v1_todo_url(@api_v1_todo)
    end

    assert_redirected_to api_v1_todos_url
  end
end
