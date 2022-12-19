import React from "react"
import { GoogleMap, useJsApiLoader, Marker } from "@react-google-maps/api"

const options = {
  zoomControlOptions: {
    position: google.maps.ControlPosition.RIGHT_CENTER // 'right-center' ,
    // ...otherOptions
  }
}

function GoogleRoomMap() {
  const { isLoaded, loadError } = useJsApiLoader({
    googleMapsApiKey: ENV['GOOG_MAPS_API_KEY'],
  })
  const renderMap = () => {
    const onLoad = React.useCallback(
      function onLoad(mapInstance) {
        // do something with the map instance
      }
    )
    return (
      <GoogleMap
        options={options}
        onLoad={onLoad}>
        {/* my map components */}
      </GoogleMap>
    )
  }
  if (loadError) {
    return <div>Map cannot be loaded right now, sorry.</div>
  }

  return isLoaded ? renderMap() : <div>Spinner</div>
}

export default GoogleRoomMap
