;comments

  (script-fu-register
    "script-fu-prep-layers"                         ;func name
    "Prep!"                                         ;menu label
    "Change active layer to 30% Opacity, add transparent layer, add white layer."       ;description
    "Seraphelki"                                    ;author
    "Feel free to use;\
      2015, a GIMP User"                            ;copyright notice
    "A Point In Time"                               ;date created
    "RGBA"                                          ;image type that the script works on
    SF-IMAGE "image" 0
    SF-DRAWABLE "drawable" 0
  )
  (script-fu-menu-register "script-fu-prep-layers" "<Image>/Layer/Prep")
  (define (script-fu-prep-layers image drawable) ;
    (let*
          (theImageWidth (car (gimp-image-width image))) ;this is where the first syntaxissue was, and I just threw it all on one line while trying out things to fix - was originally no different than below, so the others must have the same issue)
          (theImageHeight
                  (car
                      (gimp-image-height image)
                  )
          )
          (theLayer1
                  (car
                      (gimp-layer-new
                          Image
                          theImageWidth
                          theImageHeight
                          RGBA-Image
                          "Line Layer"
                          100
                          NORMAL
                      )
                  )
          )
          (theLayer2
                  (car
                      (gimp-layer-new
                          Image
                          theImageWidth
                          theImageHeight
                          RGBA-Image
                          "White Layer"
                          100
                          NORMAL
                      )
                  )
          )
    ) ;end local variables
    ; will do active layer check and
    ; opacity change on it in these lines
    (gimp-image-add-layer Image theLayer1 -1)       ;introduce layer at top of stack
    (gimp-image-add-layer Image theLayer2 0)        ;zero not correct I think, have to research smoothest way to add to bottom of stack
    (gimp-context-set-background '(255 255 255) )   ;set color2 to White
    (gimp-drawable-fill theLayer2 BACKGROUND-FILL)  ;colofill White Layer
  )
