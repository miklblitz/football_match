# frozen_string_literal: true

class GamerTeamPresenter < GamerPresenter
  def as_json(*)
    super.merge({
      team: @object.team.name
    })
  end
end
