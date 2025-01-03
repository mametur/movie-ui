import React from 'react'
import Hero from '../hero/Hero'

const Home = ({movies}) => {
if (!movies) {
    return <div>Loading movies...</div>;
  }
  return (
   <Hero movies={movies}/>
  )
}

export default Home