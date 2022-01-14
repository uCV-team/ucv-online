module Mailkick::OptOutOverride
  def self.prepended(base)
    base.after_save :update_preference
  end

  private

  def update_preference
    user.update list.to_sym => !active
  end

  Mailkick::OptOut.prepend self
end
