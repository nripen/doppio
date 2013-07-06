module ProjectsHelper
  ISSUETYPES = ['Bug', 'Improvement', 'New Feature']
  def projectlead_for(project)
	User.find(project.user_id).name
  end


  def populate_issue_types(project)
  	ISSUETYPES.each do |issue|
  		@issuetype = project.issue_types.build(name: issue)
  		@issuetype.save
  	end
  end
end
