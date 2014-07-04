json.array!(@goals) do |goal|
  json.extract! goal, :id, :player, :minute, :team, :opponent, :date, :penalty, :own_goal, :stadium, :home, :competition, :stage, :assist, :video, :gfy
  json.url goal_url(goal, format: :json)
end
