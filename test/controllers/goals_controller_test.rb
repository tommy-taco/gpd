require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: { assist: @goal.assist, competition: @goal.competition, date: @goal.date, gfy: @goal.gfy, home: @goal.home, minute: @goal.minute, opponent: @goal.opponent, own_goal: @goal.own_goal, penalty: @goal.penalty, player: @goal.player, stadium: @goal.stadium, stage: @goal.stage, team: @goal.team, video: @goal.video }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: { assist: @goal.assist, competition: @goal.competition, date: @goal.date, gfy: @goal.gfy, home: @goal.home, minute: @goal.minute, opponent: @goal.opponent, own_goal: @goal.own_goal, penalty: @goal.penalty, player: @goal.player, stadium: @goal.stadium, stage: @goal.stage, team: @goal.team, video: @goal.video }
    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to goals_path
  end
end
