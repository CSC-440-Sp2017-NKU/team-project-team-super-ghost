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


### Database Commands Used:

`bin/rails g scaffold Post title:string body:text`

`bin/rails g model Comment author:string body:text post:references`

`bin/rake db:migrate`