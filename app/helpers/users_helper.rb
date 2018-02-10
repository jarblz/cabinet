module UsersHelper
  def documents(user)
    documents = {}
    if user.resume.exists?
      documents["Resume"] = user.resume.url
    elsif user.writing_sample.exists?
      documents["Writing Sample"] = user.writing_sample.url
    elsif user.transcript.exists?
      documents["Writing Sample"] = user.writing_sample.url
    end
    return documents
  end
end
