import React from 'react';

class LocationButton extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <button
        className='absolute flex items-center justify-center p-2 text-3xl bg-white border rounded-full shadow-none min-h-min right-2 top-2 hover:shadow-xl'
        onClick={this.props.onClick}
      >
        <i className='-mb-1 fa-solid fa-location-arrow text-md gradient-text'></i>
      </button>
    );
  }
}

export default LocationButton;
