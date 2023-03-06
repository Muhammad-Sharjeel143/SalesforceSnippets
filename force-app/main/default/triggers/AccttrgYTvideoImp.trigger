trigger AccttrgYTvideoImp on Account (before insert) {
    AccttrgYTvideoImp.updateRating(trigger.new);
}