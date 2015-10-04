;================================================;
;  worldmap.ncl
;=================================================;

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "cubedsphereline.ncl"

begin
  wks  = gsn_open_wks("eps","worldmap")              ; open a eps file
  gsn_define_colormap(wks,(/"white","black","tan","LightBlue","Blue"/))

  res                = True              ; plot mods desired
  res@gsnDraw        = False             ; don't draw the plots
  res@gsnFrame       = False             ; don't advance the frame
  res@gsnCenterStringFontHeightF = 0.03  ; set the center string font height
  
;-------------------------------------------------------------------------------
;----------The following two resources, mpGridAndLimbOn and mpPerimOn, will be turned on
;----------and off depending on the map projections used below.
;-------------------------------------------------------------------------------  
  res@mpGridAndLimbOn   = True           ; turn on lat/lon lines
  res@mpPerimOn         = False 	      ; turn off perimeter
  
  res@mpGridLatSpacingF =  15.           ; change latitude  line spacing
  res@mpGridLonSpacingF =  15.           ; change longitude line spacing
  res@mpGridLineColor   = "black"  ; trick ncl into drawing perimeter
  
  res@mpGridMaskMode         = "MaskLand"

  res@mpGridLineDashPattern  = 2
  res@mpLandFillColor        = "tan"
  res@mpOceanFillColor       = "LightBlue"
  res@mpInlandWaterFillColor = "LightBlue"
  res@mpGeophysicalLineColor = "Black"

  res@mpCenterLonF = -110.0
  res@mpCenterLatF = 40.0

  map = new(2,graphic)

  res@mpGridAndLimbOn   = True           ; turn on lat/lon lines
  res@mpPerimOn         = False 	      ; turn off perimeter
  res@mpProjection = "Orthographic"       
  res@gsnCenterString = "VR-CESM 0.25 degree"
  map(0) = gsn_csm_map(wks,res) 

  res@mpGridAndLimbOn   = True           ; turn on lat/lon lines
  res@mpPerimOn         = False 	      ; turn off perimeter
  res@mpProjection = "Orthographic"       
  res@gsnCenterString = "VR-CESM 0.125 degree"
  map(1) = gsn_csm_map(wks,res) 

  plres = True
  plres@gsLineThicknessF = 3.0
  plres@gsLineDashPattern = 2

  plres2 = True
  plres2@gsLineThicknessF = 3.0

  lineA1 = cubedsphereline(wks, map(0), -170.0, -70.0, 53.0, 53.0, 5, plres)
  lineA2 = cubedsphereline(wks, map(0), -70.0, -85.0, 53.0, 40.0, 5, plres)
  lineA3 = cubedsphereline(wks, map(0), -85.0, -85.0, 40.0, 5.0, 1, plres)
  lineA4 = cubedsphereline(wks, map(0), -85.0, -155.0, 5.0, 5.0, 2, plres)
  lineA5 = cubedsphereline(wks, map(0), -155.0, -155.0, 5.0, 40.0, 2, plres)
  lineA6 = cubedsphereline(wks, map(0), -155.0, -170.0, 40.0, 53.0, 5, plres)

  lineB1 = cubedsphereline(wks, map(0), -147.0, -90.0, 50.0, 50.0, 5, plres2)
  lineB2 = cubedsphereline(wks, map(0), -90.0, -96.0, 50.0, 42.0, 5, plres2)
  lineB3 = cubedsphereline(wks, map(0), -96.0, -96.0, 42.0, 17.0, 2, plres2)
  lineB4 = cubedsphereline(wks, map(0), -96.0, -142.0, 17.0, 17.0, 2, plres2)
  lineB5 = cubedsphereline(wks, map(0), -142.0, -142.0, 17.0, 42.0, 2, plres2)
  lineB6 = cubedsphereline(wks, map(0), -142.0, -147.0, 42.0, 50.0, 5, plres2)


  lineC1 = cubedsphereline(wks, map(1), -170.0, -70.0, 53.0, 53.0, 5, plres)
  lineC2 = cubedsphereline(wks, map(1), -70.0, -85.0, 53.0, 40.0, 5, plres)
  lineC3 = cubedsphereline(wks, map(1), -85.0, -85.0, 40.0, 0.0, 1, plres)
  lineC4 = cubedsphereline(wks, map(1), -85.0, -155.0, 0.0, 0.0, 2, plres)
  lineC5 = cubedsphereline(wks, map(1), -155.0, -155.0, 0.0, 40.0, 2, plres)
  lineC6 = cubedsphereline(wks, map(1), -155.0, -170.0, 40.0, 53.0, 5, plres)

  lineD1 = cubedsphereline(wks, map(1), -147.0, -90.0, 50.0, 50.0, 5, plres2)
  lineD2 = cubedsphereline(wks, map(1), -90.0, -96.0, 50.0, 42.0, 5, plres2)
  lineD3 = cubedsphereline(wks, map(1), -96.0, -96.0, 42.0, 12.0, 2, plres2)
  lineD4 = cubedsphereline(wks, map(1), -96.0, -142.0, 12.0, 12.0, 2, plres2)
  lineD5 = cubedsphereline(wks, map(1), -142.0, -142.0, 12.0, 42.0, 2, plres2)
  lineD6 = cubedsphereline(wks, map(1), -142.0, -147.0, 42.0, 50.0, 5, plres2)

  lineE1 = cubedsphereline(wks, map(1), -132.0, -103.0, 48.0, 48.0, 5, plres)
  lineE2 = cubedsphereline(wks, map(1), -103.0, -105.0, 48.0, 43.0, 5, plres)
  lineE3 = cubedsphereline(wks, map(1), -105.0, -105.0, 43.0, 23.0, 2, plres)
  lineE4 = cubedsphereline(wks, map(1), -105.0, -130.0, 23.0, 23.0, 2, plres)
  lineE5 = cubedsphereline(wks, map(1), -130.0, -130.0, 23.0, 43.0, 2, plres)
  lineE6 = cubedsphereline(wks, map(1), -130.0, -132.0, 43.0, 48.0, 5, plres)

  lineF1 = cubedsphereline(wks, map(1), -129.0, -106.0, 46.5, 46.5, 5, plres2)
  lineF2 = cubedsphereline(wks, map(1), -106.0, -107.0, 46.5, 43.0, 5, plres2)
  lineF3 = cubedsphereline(wks, map(1), -107.0, -107.0, 43.0, 25.0, 2, plres2)
  lineF4 = cubedsphereline(wks, map(1), -107.0, -128.0, 25.0, 25.0, 2, plres2)
  lineF5 = cubedsphereline(wks, map(1), -128.0, -128.0, 25.0, 43.0, 2, plres2)
  lineF6 = cubedsphereline(wks, map(1), -128.0, -129.0, 43.0, 46.5, 5, plres2)

  txres = True
  txres@txFont = 22
  txres@txFontHeightF = 0.02
  txres@txFontThicknessF = 2.0

  text1 = gsn_add_text(wks, map(0), "28km", -118.0, 37.0, txres);
  text2 = gsn_add_text(wks, map(0), "110km", -118.0, 90.0, txres);

  text3 = gsn_add_text(wks, map(1), "14km", -118.0, 37.0, txres);
  text4 = gsn_add_text(wks, map(1), "28km", -118.0, 19.0, txres);
  text5 = gsn_add_text(wks, map(1), "110km", -118.0, 90.0, txres);

  yres = True                            ; panel resource list
  yres@gsnMaximize = True                ; maximize the plots
  yres@gsnPaperOrientation  = "portrait" ; set paper orientation to portrait    
  yres@gsnPanelYWhiteSpacePercent = 5.0  ; set white space between panels in y-direction
  
  gsn_panel(wks,map(:1),(/1,2/),yres) 
end
