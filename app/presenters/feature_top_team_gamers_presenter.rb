# frozen_string_literal: true

class FeatureTopTeamGamersPresenter < Presenter
  def as_json(*)
     @object[:gamers].map.with_index { |o,i| GamerTeamPresenter.new(o).as_json.merge(top: @object[:counts][i]) }
  end
end
