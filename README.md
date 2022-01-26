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
