#issues_list span.octicon-issue-opened, #issues_list span.octicon-issue-closed {
    display: none;
}

.list-group-item-number {
    float: left;
    margin: 0 12px 0 0;
}

.list-group-item.selectable {
    padding-left: 40px;
}

/** github.com **/

h4.list-group-item-name {
    margin-right: 0;
}

span.label {
    font-size: 12px;
    font-weight: normal;
}

span.labels {
    float: right;
    margin: 0;
}

span.octicon-git-pull-request {
    margin: 0 5px 0 -5px;
}


