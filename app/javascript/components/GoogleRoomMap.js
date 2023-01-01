import React from 'react';
import { GoogleMap, LoadScript, Marker } from '@react-google-maps/api';
import LocationButton from './LocationButton';

const taiwanBounds = {
  north: 28.17565,
  south: 19.17565,
  west: 116.9738819,
  east: 124.9738819,
};

const mapOptions = {
  zoomControl: true,
  streetViewControl: true,
  mapTypeControl: false,
  fullscreenControl: false,
  restriction: {
    latLngBounds: taiwanBounds,
  },
};
class GoogleRoomMap extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      map: /** @type google.maps.Map */ (null),
    };
  }

  render() {
    let latAvg =
      this.props.data
        .map((datum) => parseFloat(datum.lat))
        .reduce((a, b) => a + b, 0) / this.props.data.length;
    let lngAvg =
      this.props.data
        .map((datum) => parseFloat(datum.lng))
        .reduce((a, b) => a + b, 0) / this.props.data.length;
    let center = { lat: latAvg, lng: lngAvg };

    return (
      <LoadScript googleMapsApiKey={this.props.api_key}>
        <div className='relative'>
          <GoogleMap
            mapContainerStyle={{
              width: '100%',
              height: `${window.screen.height - 236}px`,
            }}
            center={center}
            zoom={7.8}
            options={mapOptions}
            onLoad={(map) => this.setState({ map: map })}
          >
            <>
              {/* Child components, such as markers, info windows, etc. */}
              {this.props.data.map((room) => {
                return (
                  <Marker
                    key={room.id}
                    position={{
                      lat: parseFloat(room.lat),
                      lng: parseFloat(room.lng),
                    }}
                  />
                );
              })}
            </>
          </GoogleMap>
          <LocationButton
            onClick={() => {
              this.state.map.panTo(center);
              this.state.map.setZoom(7.8);
            }}
          />
        </div>
      </LoadScript>
    );
  }
}

export default GoogleRoomMap;
