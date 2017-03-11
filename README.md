# team-project-team-super-ghost
##### Hudson, Nathaniel - Jansen, Shane - Owens, Kirby - Zumwalde, Zach #####

The following repository will be used for a project implementing NKU-Net, an NKU social platform for NKU students and faculty members to communicate.


### Database Commands Used:
bin/rails g scaffold Post title:string body:text
bin/rails g model Comment author:string body:text post:references
bin/rake db:migrate
