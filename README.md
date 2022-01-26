# discoRd-survey-kos

This shinyApp provides an platform for both of our surveys with the use of `shiny.quetzio` package.

```r
devtools::install.github("StatisMike/shiny.quetzio")
```

Long loading time at the beginning is caused by multiple readings from googlesheets, not by rendering itself.

We can also switch from using the built-in method of reading every sheet for source and description
to just download whole googlesheet with `googledrive` - I don't know how usable it would be on 
places like *shinyapps.io*?. Alternatively, we can switch to reading tables from local
file when the survey will become stable (no more frequent changes to the answers)

[Source googlesheet](https://docs.google.com/spreadsheets/d/19JsV3XABSn4DNFLYMfzmWSrQ6zTPp4X1xIy2Ex4QzZ0/)

The option to send answers to the googlesheets is currently turned off - as it will need
some authetication, as I don't want to make any googlesheets allowed to write for
everyone with a link.

If you want to test this thoroughly, you can uncomment the lines in the call 
initializing objects `discoRd_quetzio` and `get_togethR_quetzio` and contact
me to give you write-access to the googlesheet.

- lines in `discoRd_quetzio` is currently set to save answers for all questionnaires
together, after the completion of whole link. They can be set also to save answers
for individual quetzio (pages) independently.

It should be noted that the robot check measure currently will be meaningful only during 
analysis data - conditional checking validity of values put to `textInput` isn't
currently implemented. If anyone want to take a shot at this. Please check
the `shiny.quetzio` repo.

