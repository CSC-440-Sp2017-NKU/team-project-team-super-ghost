# team-project-team-super-ghost
##### Hudson, Nathaniel - Jansen, Shane - Owens, Kirby - Zumwalde, Zach #####

> ```
>  .-') _     ('-.   ('-.     _   .-')            .-')                _ (`-.   ('-.  _  .-')                    ('-. .-.              .-')   .-') _    
>(  OO) )  _(  OO) ( OO ).-.( '.( OO )_         ( OO ).             ( (OO  )_(  OO)( \( -O )                  ( OO )  /             ( OO ).(  OO) )   
>/     '._(,------./ . --. / ,--.   ,--.)      (_)---\_),--. ,--.  _.`     (,------.,------.         ,----.   ,--. ,--..-'),-----. (_)---\_)     '._  
>|'--...__)|  .---'| \-.  \  |   `.'   |       /    _ | |  | |  | (__...--''|  .---'|   /`. '       '  .-./-')|  | |  ( OO'  .-.  '/    _ ||'--...__) 
>'--.  .--'|  |  .-'-'  |  | |         |       \  :` `. |  | | .-')|  /  | ||  |    |  /  | |       |  |_( O- )   .|  /   |  | |  |\  :` `.'--.  .--' 
>    |  |  (|  '--.\| |_.'  | |  |'.'|  |        '..`''.)|  |_|( OO )  |_.' (|  '--. |  |_.' |       |  | .--, \       \_) |  |\|  | '..`''.)  |  |    
>    |  |   |  .--' |  .-.  | |  |   |  |       .-._)   \|  | | `-' /  .___.'|  .--' |  .  '.'      (|  | '. (_/  .-.  | \ |  | |  |.-._)   \  |  |    
>    |  |   |  `---.|  | |  | |  |   |  |       \       ('  '-'(_.-'|  |     |  `---.|  |\  \        |  '--'  ||  | |  |  `'  '-'  '\       /  |  |    
>    `--'   `------'`--' `--' `--'   `--'        `-----'  `-----'   `--'     `------'`--' '--'        `------' `--' `--'    `-----'  `-----'   `--' 
> ```
  
The following repository will be used for a project implementing NKU-Net, an NKU social platform for NKU students and faculty members to communicate.

## Setup
`bin/bundle install`

`bin/rake db:migrate`

### Only use for initial DB setup.  Will clear DB!
`bin/rake db:schema:load`


## Database Commands Used:
##### Iteration 1
`bin/rails g scaffold Post title:string body:text author:string course:references`

`bin/rails g model Comment author:string body:text post:references`

##### Iteration 2
`bin/rails g scaffold Course title:string`

`bin/rails g model User name:string email:string password_digest:string`

`bin/rails g migration CreateJoinTableUserCourses user course`

`rails g model PostVotes post:references user:references is_upvote:boolean`

`rails g model CommentVotes comment:references user:references is_upvote:boolean`

##### Iteration 3
`rails g model Uploads filename:text user:references`
