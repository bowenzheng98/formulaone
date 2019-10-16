String parsePositionText(String text){
  switch (text) {
    case "R":
      return "Retired";
      break;
    case "D":
      return "Disqualified";
      break;
    case "E":
      return "Excluded";
      break;
    case "W":
      return "Withdrawn";
      break;
    case "F":
      return "Failed to qualify";
      break;
    case "N":
      return "Not classified";
      break;
    default:
      return "";
      break;
  }
}