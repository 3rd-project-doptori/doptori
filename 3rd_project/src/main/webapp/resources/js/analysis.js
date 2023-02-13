Dropzone.autoDiscover = false;
var dropzonePreviewNode = document.querySelector('#dropzone-preview-list');
dropzonePreviewNode.id = '';
var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

const dropzone = new Dropzone(".dropzone", {
    url: "https://httpbin.org/post", // 파일을 업로드할 서버 주소 url. 
    method: "post", // 기본 post로 request 감. put으로도 할수있음
    
    previewTemplate: previewTemplate, // 만일 기본 테마를 사용하지않고 커스텀 업로드 테마를 사용하고 싶다면
    previewsContainer: '#dropzone-preview', // 드롭존 영역을 .dropzone이 아닌 다른 엘리먼트에서 하고싶을때
});