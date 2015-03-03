;******************************************************************************
; P.A.Ullrich
; Draw a cubed sphere grid line
;

undef("cubedsphereline")
function cubedsphereline(wks, plot, lon1, lon2, lat1, lat2, np, gsres)
local lon1r, lon2r, lat1r, lat2r, alpha1, alpha2, beta1, beta2, alpha, beta, lon, lat
begin

  Nlines = 20

  lon1r = lon1 * 3.14159 / 180.0
  lon2r = lon2 * 3.14159 / 180.0
  lat1r = lat1 * 3.14159 / 180.0
  lat2r = lat2 * 3.14159 / 180.0

  if (np .eq. 1) then
    alpha1 = lon1r
	alpha2 = lon2r

	beta1 = atan2(tan(lat1r), cos(lon1r))
	beta2 = atan2(tan(lat2r), cos(lon2r))

    alpha = fspan(alpha1, alpha2, 20)
    beta = fspan(beta1, beta2, 20)

	lon = alpha / 3.14159 * 180.0
	lat = atan(tan(beta) * cos(alpha)) / 3.14159 * 180.0

	return (gsn_add_polyline(wks, plot, lon, lat, gsres))

  end if

  if (np .eq. 2) then
    alpha1 = lon1r
	alpha2 = lon2r

	beta1 = atan2(tan(lat1r), sin(lon1r))
	beta2 = atan2(tan(lat2r), sin(lon2r))

    alpha = fspan(alpha1, alpha2, 20)
    beta = fspan(beta1, beta2, 20)

	lon = alpha / 3.14159 * 180.0
	lat = atan(tan(beta) * sin(alpha)) / 3.14159 * 180.0

	return (gsn_add_polyline(wks, plot, lon, lat, gsres))

  end if

  if (np .eq. 5) then

    alpha1 = atan2(sin(lon1r),tan(lat1r))
    alpha2 = atan2(sin(lon2r),tan(lat2r))

    beta1 = atan2(cos(lon1r),tan(lat1r))
    beta2 = atan2(cos(lon2r),tan(lat2r))

    alpha = fspan(alpha1, alpha2, 20)
    beta = fspan(beta1, beta2, 20)
  
    lon = atan2(tan(alpha), tan(beta)) / 3.14159 * 180.0
    lat = atan(1.0/sqrt(tan(alpha) * tan(alpha) + tan(beta) * tan(beta))) / 3.14159 * 180.0

	return (gsn_add_polyline(wks, plot, lon, lat, gsres))

  end if

  return (0)
end

