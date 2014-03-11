(function ($) {
    var BootstrapPaginator = function (element, settings) {
            this.init(element, settings);
        },
        old = null;
    BootstrapPaginator.prototype = {
        init: function (element, options) {
            this.$element = $(element);
            var id = this.$element.attr("id");
            this.currentPage = 1;
            this.lastPage = 1;
            this.setOptions(options);
            this.initialized = true;
        },
        setOptions: function (options) {
            this.options = $.extend({}, (this.options || $.fn.bootstrapPaginator.defaults), options);
            this.totalPages = parseInt(this.options.totalPages, 10);  //setup the total pages property.
            this.numberOfPages = parseInt(this.options.numberOfPages, 10); //setup the numberOfPages to be shown
            //move the set current page after the setting of total pages. otherwise it will cause out of page exception.
            if (options && typeof (options.currentPage)  !== 'undefined') {
                this.setCurrentPage(options.currentPage);
            }
            this.listen();
            //render the paginator
            this.render();
            if (!this.initialized && this.lastPage !== this.currentPage) {
                this.$element.trigger("page-changed", [this.lastPage, this.currentPage]);
            }

        },

        /**
         * Sets up the events listeners. Currently the pageclicked and pagechanged events are linked if available.
         *
         * */
        listen: function () {
            this.$element.off("page-clicked");
            this.$element.off("page-changed");// unload the events for the element
            if (typeof (this.options.onPageClicked) === "function") {
                this.$element.bind("page-clicked", this.options.onPageClicked);
            }
            if (typeof (this.options.onPageChanged) === "function") {
                this.$element.on("page-changed", this.options.onPageChanged);
            }
            this.$element.bind("page-clicked", this.onPageClicked);
        },
        destroy: function () {
            this.$element.off("page-clicked");
            this.$element.off("page-changed");
            this.$element.removeData('bootstrapPaginator');
            this.$element.empty();
        },

        /**
         * Shows the page
         *
         * */
        show: function (page) {
            this.setCurrentPage(page);
            this.render();
            if (this.lastPage !== this.currentPage) {
                this.$element.trigger("page-changed", [this.lastPage, this.currentPage]);
            }
        },
        showNext: function () {
            var pages = this.getPages();
            if (pages.next) {
                this.show(pages.next);
            }
        },
        showPrevious: function () {
            var pages = this.getPages();
            if (pages.prev) {
                this.show(pages.prev);
            }
        },
        showFirst: function () {
            var pages = this.getPages();
            if (pages.first) {
                this.show(pages.first);
            }
        },
        showLast: function () {
            var pages = this.getPages();
            if (pages.last) {
                this.show(pages.last);
            }
        },
        onPageItemClicked: function (event) {
            var type = event.data.type,
                page = event.data.page;
            this.$element.trigger("page-clicked", [event, type, page]);
        },

        onPageClicked: function (event, originalEvent, type, page) {
            //show the corresponding page and retrieve the newly built item related to the page clicked before for the event return
            var currentTarget = $(event.currentTarget);
            switch (type) {
                case "first":
                    currentTarget.bootstrapPaginator("showFirst");
                    break;
                case "prev":
                    currentTarget.bootstrapPaginator("showPrevious");
                    break;
                case "next":
                    currentTarget.bootstrapPaginator("showNext");
                    break;
                case "last":
                    currentTarget.bootstrapPaginator("showLast");
                    break;
                case "page":
                    currentTarget.bootstrapPaginator("show", page);
                    break;
            }
        },

        /**
         * Renders the paginator according to the internal properties and the settings.
         *
         *
         * */
        render: function () {
            //fetch the container class and add them to the container
            var containerClass = this.getValueFromOption(this.options.containerClass, this.$element),
                size = this.options.size || "normal",
                alignment = this.options.alignment || "left",
                pages = this.getPages(),
                listContainer = this.options.bootstrapMajorVersion === 2 ? $("<ul></ul>") : this.$element,
                listContainerClass = this.options.bootstrapMajorVersion === 2 ? this.getValueFromOption(this.options.listContainerClass, listContainer) : null,
                first = null,
                prev = null,
                next = null,
                last = null,
                p = null,
                i = 0;
            this.$element.prop("class", "");
            this.$element.addClass("pagination");
            switch (size.toLowerCase()) {
                case "large":
                case "small":
                case "mini":
                    this.$element.addClass($.fn.bootstrapPaginator.sizeArray[this.options.bootstrapMajorVersion][size.toLowerCase()]);
                    break;
                default:
                    break;
            }
            this.$element.addClass(containerClass);
            //empty the outter most container then add the listContainer inside.
            this.$element.empty();
            if (this.options.bootstrapMajorVersion === 2) {
                this.$element.append(listContainer);
                listContainer.addClass(listContainerClass);
            }
            //update the page element reference
            this.pageRef = [];
            if (pages.first) {//if the there is first page element
                first = this.buildPageItem("first", pages.first);
                if (first) {
                    listContainer.append(first);
                }
            }

            if (pages.prev) {//if the there is previous page element
                prev = this.buildPageItem("prev", pages.prev);
                if (prev) {
                    listContainer.append(prev);
                }
            }
            for (i = 0; i < pages.length; i = i + 1) {//fill the numeric pages.
                p = this.buildPageItem("page", pages[i]);
                if (p) {
                    listContainer.append(p);
                }
            }
            if (pages.next) {//if there is next page
                next = this.buildPageItem("next", pages.next);
                if (next) {
                    listContainer.append(next);
                }
            }
            if (pages.last) {//if there is last page
                last = this.buildPageItem("last", pages.last);
                if (last) {
                    listContainer.append(last);
                }
            }
        },
        buildPagination:function(type,page){
            var htmlBuffer = [];
            htmlBuffer.push("<div id='tablePagination'>");
            htmlBuffer.push("<span id='tablePagination_perPage'>");
            htmlBuffer.push("<select id='tablePagination_rowsPerPage'><option value='5'>5</option></select>");
            htmlBuffer.push("per page");
            htmlBuffer.push("</span>");
            htmlBuffer.push("<span id='tablePagination_paginater'>");
            htmlBuffer.push("<img id='tablePagination_firstPage' src='"+defaults.firstArrow+"'>");
            htmlBuffer.push("<img id='tablePagination_prevPage' src='"+defaults.prevArrow+"'>");
            htmlBuffer.push("Page");
            htmlBuffer.push("<input id='tablePagination_currPage' type='input' value='"+currPageNumber+"' size='1'>");
            htmlBuffer.push("of <span id='tablePagination_totalPages'>"+totalPages+"</span>");
            htmlBuffer.push("<img id='tablePagination_nextPage' src='"+defaults.nextArrow+"'>");
            htmlBuffer.push("<img id='tablePagination_lastPage' src='"+defaults.lastArrow+"'>");
            htmlBuffer.push("</span>");
            htmlBuffer.push("</div>");
            return htmlBuffer.join("").toString();
        },
        buildPageItem: function (type, page) {
            var itemContainer = $("<li></li>"),//creates the item container
                itemContent = $("<a></a>"),//creates the item content
                text = "",
                itemContainerClass = (page === this.currentPage) ? "active" : "",
                itemContentClass = "";
            switch (type) {
                case "first":
                    text = "&lt;&lt";
                    break;
                case "last":
                    text = "&gt;&gl";
                    break;
                case "prev":
                    text = "&lt";
                    break;
                case "next":
                    text = "&gt";
                    break;
                case "page":
                    text = page;
                    break;
            }
            itemContainer.addClass(itemContainerClass).append(itemContent);
            itemContent.addClass(itemContentClass).html(text).on("click", null, {type: type, page: page}, $.proxy(this.onPageItemClicked, this));
            return itemContainer;
        },

        setCurrentPage: function (page) {
            if (page > this.totalPages || page < 1) {// if the current page is out of range, throw exception.
                throw "Page out of range";
            }
            this.lastPage = this.currentPage;
            this.currentPage = parseInt(page, 10);
        },

        /**
         * Gets an array that represents the current status of the page object. Numeric pages can be access via array mode. length attributes describes how many numeric pages are there. First, previous, next and last page can be accessed via attributes first, prev, next and last. Current attribute marks the current page within the pages.
         *
         * @return object output objects that has first, prev, next, last and also the number of pages in between.
         * */
        getPages: function () {
            var totalPages = this.totalPages,// get or calculate the total pages via the total records
                pageStart = (this.currentPage % this.numberOfPages === 0) ? (parseInt(this.currentPage / this.numberOfPages, 10) - 1) * this.numberOfPages + 1 : parseInt(this.currentPage / this.numberOfPages, 10) * this.numberOfPages + 1,//calculates the start page.
                output = [],
                i = 0,
                counter = 0;
            pageStart = pageStart < 1 ? 1 : pageStart;//check the range of the page start to see if its less than 1.
            for (i = pageStart, counter = 0; counter < this.numberOfPages && i <= totalPages; i = i + 1, counter = counter + 1) {//fill the pages
                output.push(i);
            }
            output.first = 1;//add the first when the current page leaves the 1st page.
            if (this.currentPage > 1) {// add the previous when the current page leaves the 1st page
                output.prev = this.currentPage - 1;
            } else {
                output.prev = 1;
            }
            if (this.currentPage < totalPages) {// add the next page when the current page doesn't reach the last page
                output.next = this.currentPage + 1;
            } else {
                output.next = totalPages;
            }
            output.last = totalPages;// add the last page when the current page doesn't reach the last page
            output.current = this.currentPage;//mark the current page.
            output.total = totalPages;
            output.numberOfPages = this.options.numberOfPages;
            return output;

        }
    };
    /* TYPEAHEAD PLUGIN DEFINITION
     * =========================== */

    old = $.fn.bootstrapPaginator;
    $.fn.bootstrapPaginator = function (settings) {
        var defaults = {
            firstArrow : (new Image()).src="/img/first.gif",
            prevArrow : (new Image()).src="/img/prev.gif",
            lastArrow : (new Image()).src="/img/last.gif",
            nextArrow : (new Image()).src="/img/next.gif",
            rowsPerPage : 5,
            currPage : 1,
            optionsForRows : [5,10,25,50,100],
            topNav : false
        };
        settings= $.extend(defaults,settings);

        var result = null;
        $(this).each(function (index, item) {
            var table=$(this)[0];
            var totalPagesId, currPageId, rowsPerPageId, firstPageId, prevPageId, nextPageId, lastPageId;
//            totalPagesId = '#tablePagination_totalPages';
//            currPageId = '#tablePagination_currPage';
//            rowsPerPageId = '#tablePagination_rowsPerPage';
            firstPageId = '#tablePagination_firstPage';
            prevPageId = '#tablePagination_prevPage';
            nextPageId = '#tablePagination_nextPage';
            lastPageId = '#tablePagination_lastPage';

            var tblLocation = (defaults.topNav) ? "prev" : "next";
            var tableRows = $.makeArray($('tbody tr', table));

            var numRows = tableRows.length
            var totalPages = resetTotalPages();
            var currPageNumber = (defaults.currPage > totalPages) ? 1 : defaults.currPage;
            if ($.inArray(defaults.rowsPerPage, defaults.optionsForRows) == -1)
                defaults.optionsForRows.push(defaults.rowsPerPage);

            function hideOtherPages(pageNum) {
                if (pageNum==0 || pageNum > totalPages)
                    return;
                var startIndex = (pageNum - 1) * defaults.rowsPerPage;
                var endIndex = (startIndex + defaults.rowsPerPage - 1);
                $(tableRows).show();
                $(tableRows).filter(function(index){
                    return i < startIndex || i > endIndex;
                }).hide();
            }
            var $this = $(item),
                data = $this.data('bootstrapPaginator'),
                options = (typeof option !== 'object') ? null : option;
            if (!data) {
                data = new BootstrapPaginator(this, settings);
                $this = $(data.$element);
                $this.data('bootstrapPaginator', data);
                return;
            }
            result = data.setOptions(settings);
        });
        return result;
    };

    $.fn.bootstrapPaginator.sizeArray = {
        "2": {
            "large": "pagination-large",
            "small": "pagination-small",
            "mini": "pagination-mini"
        },
        "3": {
            "large": "pagination-lg",
            "small": "pagination-sm",
            "mini": ""
        }

    };
    $.fn.bootstrapPaginator.defaults = {
        containerClass: "",
        size: "normal",
        alignment: "left",
        listContainerClass: "",
        currentPage: 1,
        numberOfPages: 5,
        totalPages: 1,
        pageUrl: function (type, page, current) {
            return null;
        },
        onPageClicked: null,
        onPageChanged: null,
        useBootstrapTooltip: false,
        shouldShowPage: function (type, page, current) {
            var result = true;
            switch (type) {
                case "first":
                    result = (current !== 1);
                    break;
                case "prev":
                    result = (current !== 1);
                    break;
                case "next":
                    result = (current !== this.totalPages);
                    break;
                case "last":
                    result = (current !== this.totalPages);
                    break;
                case "page":
                    result = true;
                    break;
            }
            return result;
        },
        bootstrapTooltipOptions: {
            animation: true,
            html: true,
            placement: 'top',
            selector: false,
            title: "",
            container: false
        }
    };
    $.fn.bootstrapPaginator.Constructor = BootstrapPaginator;
}(window.jQuery));
