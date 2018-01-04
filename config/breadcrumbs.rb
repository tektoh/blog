# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :admin_dashboard do
  link '<i class="fa fa-dashboard"></i> Home'.html_safe, admin_dashboard_path
end

crumb :admin_users do
  link 'ユーザー', admin_users_path
  parent :admin_dashboard
end

crumb :admin_user do |user|
  link 'プロフィール', admin_user_path(user)
  parent :admin_users
end

crumb :new_admin_user do
  link 'ユーザーの作成', new_admin_user_path
  parent :admin_users
end

crumb :admin_invitations do
  link '招待', admin_invitations_path
  parent :admin_dashboard
end

crumb :new_admin_invitation do
  link '招待状の作成', new_admin_invitation_path
  parent :admin_invitations
end
