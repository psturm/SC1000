export const angleToLedPosition = (angle, degreePerLed) => {
    /* Position starts at 1 for first LED (1..<ledCount>) */
    angle = angle + Math.ceil( -angle / 360 ) * 360
    let pos = Math.ceil((angle+1) / degreePerLed);
    return pos;
}
export const ledPositionToAngle = (ledPos, degreePerLed) => {
    const angle = ledPos * degreePerLed - degreePerLed;
    return angle;
}
