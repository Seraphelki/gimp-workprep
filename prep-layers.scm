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
      ( ;I was just missing this one, there needs to be one encasing all the stuff you are let*-ing
          (theImageWidth (car (gimp-image-width image)))
          (theImageHeight
                  (car
                      (gimp-image-height image)
                  )
          )
          (theLayer1
                  (car
                      (gimp-layer-new
                          image
                          theImageWidth
                          theImageHeight
                          1
                          "Line Layer"
                          100
                          NORMAL
                      )
                  )
          )
          (theLayer2
                  (car
                      (gimp-layer-new
                          image
                          theImageWidth
                          theImageHeight
                          1
                          "White Layer"
                          100
                          NORMAL
                      )
                  )
          )
      ) ;end local variables
      ; will do active layer check and
      ; opacity change on it in these lines
      (gimp-image-add-layer image theLayer1 -1)       ;introduce layer at top of stack
      (gimp-image-add-layer image theLayer2 0)        ;zero not correct I think, have to research smoothest way to add to bottom of stack
      (gimp-context-set-background '(255 255 255) )   ;set color2 to White
      (gimp-drawable-fill theLayer2 BACKGROUND-FILL)  ;colofill White Layer
    )
  )
