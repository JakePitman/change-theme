const checkAndPrintUsage = (argMap, passedArg) => {
  const acceptableArgNames = Object.keys(argMap)

  const printUsage = () => {
    console.log("⏸   USAGE:") 
    console.log("     change-zshrc <THEME_NAME>")
    console.log("       Acceptable theme names:")
    acceptableArgNames.forEach(name => {
      console.log(`         ${name}`)
    })
  }

  if(! acceptableArgNames.includes(passedArg)) {
    printUsage()
    return
  } else {
    return passedArg
  }
}

module.exports.checkAndPrintUsage = checkAndPrintUsage
