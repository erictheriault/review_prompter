# App Review Prompter

To use, simply copy this file into your Swift project.

Call `recordImportantAction` when the user performs an action
that indicates they are using your app in the desired way.

Call `requestReviewIfNeeded` when you'd like to show the user
the app rating popup. This will check to see if the user has
performed enough important actions (configurable in the file)
and show the system popup.
