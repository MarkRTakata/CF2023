    <script type="text/javascript">
    function PassFileName()
        {
            document.getElementById("filename").value=document.getElementById("picture").files[0].name;
        }
    </script>
    <form name="studentid" id="studentid" hx-encoding="multipart/form-data">
    <input type="hidden" id="filename" size="100" name="filename" />
    <label for="firstname">First Name</label><br />
    <input type="text" name="firstname" id="firstname" class="form-control" />
    <br />
    <label for="lastname">Last Name</label><br />
    <input type="text" name="lastname" id="lastname" class="form-control" />
    <br />
    <label for="email">Age</label><br />
    <input type="number" name="age" id="age" class="form-control" />
    <br />
    <label for="year">Year</label><br />
    <select name="year" id="year" class="form-control">
        <option value="Freshman">Freshman</option>
        <option value="Sophmore">Sophemore</option>
        <option value="Junior">Junior</option>
        <option value="Senior">Senior</option>
    </select>
    <br />
    <label for="year">Photo</label><br />
    <input type="file" name="picture" id="picture" onchange="PassFileName()" />
    <br /><br />
    <button type="button" hx-post="newID.cfm" hx-target="#viewport" class="btn btn-success btn-sm" name="getcountbtn" id="getcountbtn">Save ID</button>
    </form>