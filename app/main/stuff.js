
//https://stackoverflow.com/questions/166221/how-can-i-upload-files-asynchronously/8758614#8758614

var xhr = new XMLHttpRequest();
xhr.upload.onprogress = function(e) {
    var percent = (e.position/ e.totalSize);
    // Render a pretty progress bar
};
xhr.onreadystatechange = function(e) {
    if(this.readyState === 4) {
        // Handle file upload complete
    }
};
xhr.open('POST', '/upload', true);
xhr.setRequestHeader('X-FileName',file.name); // Pass the filename along
xhr.send(file);

https://www.html5rocks.com/en/tutorials/file/dndfiles/

<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<script>
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                  '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>

