import React from 'react'

class LocationButton extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <button
        className="absolute right-2 top-2 text-3xl text-white"
        onClick={this.props.onClick}
      >
        <i className="fa-solid fa-location-arrow"></i>
      </button>
    )
  }
}

export default LocationButton