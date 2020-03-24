# frozen_string_literal: true

class FeatureTopGamersPresenter < Presenter
  def as_json(*)
     @object[:gamers].map.with_index { |o,i| GamerPresenter.new(o).as_json.merge(top: @object[:counts][i]) }
  end
end
