import React from "react"
import { GoogleMap, LoadScript, Marker, useGoogleMap } from "@react-google-maps/api"

const mapOptions = {
  zoomControl: true,
  streetViewControl: true,
  mapTypeControl: false,
  fullscreenControl: false
}

// function GoogleRoomMap() {
//   const { isLoaded, loadError } = useJsApiLoader({
//     googleMapsApiKey: ENV['GOOG_MAPS_API_KEY'],
//   })
//   const renderMap = () => {
//     const onLoad = React.useCallback(
//       function onLoad(mapInstance) {
//         // do something with the map instance
//       }
//     )
//     return (
//       <GoogleMap
//         center={this.props.center}
//         mapContainerStyle={{width: '600px', height: '600px'}}
//         options={options}
//         onLoad={onLoad}>
//         {/* my map components */}
//       </GoogleMap>
//     )
//   }
//   if (loadError) {
//     return <div>Map cannot be loaded right now, sorry.</div>
//   }

//   return isLoaded ? renderMap() : <div>Spinner</div>
// }

const circleOptions = {
  strokeColor: '#FF0000',
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: '#FF0000',
  fillOpacity: 0.35,
  clickable: false,
  draggable: false,
  editable: false,
  visible: true,
  radius: 3000,
  zIndex: 1
}

class GoogleRoomMap extends React.Component {

  render() {
    return (
      <LoadScript
        googleMapsApiKey={this.props.api_key}
      >
        <GoogleMap
          mapContainerStyle={{width: '100%', height: '480px'}}
          center={{lat: this.props.lat, lng: this.props.lng}}
          zoom={15}
          options={mapOptions}
        >
          <>
          {/* Child components, such as markers, info windows, etc. */}
            <Marker
              position={{lat: this.props.lat, lng: this.props.lng}}
            />
          </>
        </GoogleMap>
      </LoadScript>
    )
  }
}

export default GoogleRoomMap
