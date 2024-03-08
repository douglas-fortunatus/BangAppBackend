class PhoneNumberChecker {
  static checkProvider(phoneNumber) {
    
    const firstThreeDigits = phoneNumber.slice(0, 3);

   
    switch (firstThreeDigits) {
      case '074':
      case '075':
      case '076':
        return 'Mpesa';
      case '071':
      case '065':
      case '067':
        return 'Tigo';
      case '078':
      case '068':
      case '069':
        return 'Airtel';
      case '061':
      case '062':
      case '069':
        return 'Halopesa';
      default:
        return 'Unknown Provider';
    }
  }
}
export default PhoneNumberChecker;