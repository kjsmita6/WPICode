const baseUrl = "https://d1pv87vk33.execute-api.us-east-1.amazonaws.com/";
const stage = "plswork";

const listSegmentsEndpoint = baseUrl + stage + "/listSegments";
const listPlaylistEndpoint = baseUrl + stage + "/listPlaylist";
const uploadSegmentEndpoint = baseUrl + stage + "/uploadSegment";
const deleteSegmentEndpoint = baseUrl + stage + "/deleteSegment";
const createPlaylistEndpoint = baseUrl + stage + "/createPlaylist";

const addRemoteSiteEndpoint = baseUrl + stage + "/registerProvider";
const deleteRemoteSiteEndpoint = baseUrl + stage + "/deleteRemoteSite";
const appendSegmentEndpoint = baseUrl + stage + "/appendSegment";
const deleteFromPlaylistEndpoint = baseUrl + stage + "/deletePlaylist";
const listRemoteSitesEndpoint = baseUrl + stage + "/sites";
