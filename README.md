<img src="https://user-images.githubusercontent.com/51454024/129453015-b43e918e-7335-4f79-948a-d4c552978509.png" height="100" />. 

__Mission:__  *To change the art world forever.* . . . . . [Gallify.app](https://www.gallify.app/) , [Whitepaper]()

__Sprint 15:__ January 2nd - January 16th . 7 Days Left!
      
## issue boards

[Frontend](https://github.com/orgs/Gallify/projects/1), [Databases](https://github.com/orgs/Gallify/projects/4) , [Marketplace](https://github.com/orgs/Gallify/projects/3) , [Neural Engine](https://github.com/orgs/Gallify/projects/5) 

[Drive](https://drive.google.com/drive/folders/1UyKb6CiN1pJHJfxkywHUzAGlFqLM_7Pe?usp=sharing)

[Slack](https://app.slack.com/client/T025Q30ABNY/)

## design

[UI](https://www.figma.com/file/zuARCUmckmDlEHHEQvdl1B/Gallify?node-id=0%3A1)

[System Design](https://www.figma.com/file/3x3LpTRo1HNUjGDeLfeORH/Gallify---System-Design?node-id=0%3A1)

[Figma](https://www.figma.com/files/project/32547938/Team-project?fuid=963550657994127578)

## features
1. Homescreen v1
2. Profile v1
3. Login Functionality Prod
4. Algolia v1
5. Playlist CRUD
4. Reels
5. Settings CRUD
6. Navlink: GenPlaylist->OtherProfile

## todo
2. ModelDownload: Killing Threads and Erasing un-needed data.
3. Dragging: Dragging Models
4. Model: Loading Indicators. 
5. Email->UID

## How to run Gallify.app
1. Download Big Sur and Xcode 
2. Using Terminal enter the file using the command line. 
3. Run ` pod init ` to initialize a Podfile. If you don't have cocoapods installed, run ` sudo gem install cocoapods `.
4. If a Podfile already exists, then run ` pod install `. 
5. Open the project in Xcode and hit play. 

## How to run Gallify.app on Simulator/Preview
1. When you clone the repository, delete the `ARPlayer` folder right away. ` /ViewControllers/Core/Collections/ARPlayer `
2. Comment out `lines 24-28` and `lines 53-74` in ` CollectionReelHeader.swift ` file. ` /ViewControllers/Core/Collections/Reel/Helpers/CollectionReelHeader.swift `
3. You should be good to go. Run ` pod install `. 




