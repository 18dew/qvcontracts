const TC = artifacts.require("TokenContract");

module.exports = function( deployer ) {
  console.log("Contract Deployment Started - Token ")
  deployer.deploy( TC , "SampleToken" , "STC" , "A Sample Token").then( async function ( govC ) {
    console.log("Contract Setup Started - Token ")


    console.log("Contract Setup Ended - Token ")
  });
  console.log("Contract Deployment Ended - Token ")
};
