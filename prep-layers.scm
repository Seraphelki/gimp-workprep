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
  (script-fu-menu-register "script-fu-prep-layers" "<Image>/Prep")
  (define (script-fu-prep-layers image drawable)
    (let*
      (
          (theInitial (car (gimp-image-get-active-layer image)))
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
                          "Lines"
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
                          "White"
                          100
                          NORMAL
                      )
                  )
          )
      ) ;end local variables
      (gimp-layer-set-opacity theInitial 30)            ;opacity change of initial layer
      (gimp-item-set-name theInitial "Reference")       ;change initial image layer name
      (gimp-image-insert-layer image theLayer1 0 0)     ;introduce Line layer at top of stack
      (gimp-image-insert-layer image theLayer2 0 2)     ;introduce White layer third in stack
      (gimp-context-set-background '(255 255 255) )     ;set color2 to White
      (gimp-drawable-fill theLayer2 BACKGROUND-FILL)    ;fill White Layer
      (gimp-image-set-active-layer image theLayer1)     ;set active layer to Lines
      (gimp-displays-flush)                             ;step to refresh and show changes
    )
  )
