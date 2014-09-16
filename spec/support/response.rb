class ActionController::TestResponse
  def json
    contents = JSON.parse body
    if contents.respond_to? :with_indifferent_access
      contents.with_indifferent_access
    else
      contents
    end
  end
end
