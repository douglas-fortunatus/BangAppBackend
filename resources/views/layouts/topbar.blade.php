<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bang App</title>

    <!-- Global stylesheets -->
    <link href="{{ asset('assets/css/inter.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('assets/css/styles.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('assets/css/all.min.css') }}" id="stylesheet" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script src="{{ asset('assets/js/demo_configurator.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="{{ asset('assets/js/app.js') }}"></script>
    <!-- /theme JS files -->
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="../../../assets/js/vendor/visualization/d3/d3.min.js"></script>
    <script src="../../../assets/js/vendor/visualization/d3/d3_tooltip.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="assets/js/app.js"></script>
    <script src="../../../assets/demo/pages/dashboard.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/streamgraph.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/sparklines.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/lines.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/areas.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/donuts.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/bars.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/progress.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/heatmaps.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/pies.js"></script>
    <script src="../../../assets/demo/charts/pages/dashboard/bullets.js"></script>
    <!-- /theme JS files -->

</head>

<body>

    <!-- Main navbar -->
    <div class="navbar navbar-dark navbar-expand-lg navbar-static border-bottom border-bottom-white border-opacity-10">
        <div class="container-fluid">
            <div class="d-flex d-lg-none me-2">
                <button type="button" class="navbar-toggler sidebar-mobile-main-toggle rounded-pill">
                    <i class="ph-list"></i>
                </button>
            </div>

            <div class="navbar-brand flex-1 flex-lg-0">
                <a href="index.html" class="d-inline-flex align-items-center">
                    <img src="../../../assets/images/logo_icon.svg" alt="">
                    <img src="../../../assets/images/logo_text_light.svg" class="d-none d-sm-inline-block h-16px ms-3"
                        alt="">
                </a>
            </div>

            <ul class="nav flex-row">
                <li class="nav-item d-lg-none">
                    <a href="#navbar_search" class="navbar-nav-link navbar-nav-link-icon rounded-pill"
                        data-bs-toggle="collapse">
                        <i class="ph-magnifying-glass"></i>
                    </a>
                </li>

                <li class="nav-item nav-item-dropdown-lg dropdown">
                    <a href="#" class="navbar-nav-link navbar-nav-link-icon rounded-pill"
                        data-bs-toggle="dropdown">
                        <i class="ph-squares-four"></i>
                    </a>

                    <div class="dropdown-menu dropdown-menu-scrollable-sm wmin-lg-600 p-0">
                        <div class="d-flex align-items-center border-bottom p-3">
                            <h6 class="mb-0">Browse apps</h6>
                            <a href="#" class="ms-auto">
                                View all
                                <i class="ph-arrow-circle-right ms-1"></i>
                            </a>
                        </div>

                        <div class="row row-cols-1 row-cols-sm-2 g-0">
                            <div class="col">
                                <button type="button"
                                    class="dropdown-item text-wrap h-100 align-items-start border-end-sm border-bottom p-3">
                                    <div>
                                        <img src="../../../assets/images/demo/logos/1.svg" class="h-40px mb-2"
                                            alt="">
                                        <div class="fw-semibold my-1">Customer data platform</div>
                                        <div class="text-muted">Unify customer data from multiple sources</div>
                                    </div>
                                </button>
                            </div>

                            <div class="col">
                                <button type="button"
                                    class="dropdown-item text-wrap h-100 align-items-start border-bottom p-3">
                                    <div>
                                        <img src="../../../assets/images/demo/logos/2.svg" class="h-40px mb-2"
                                            alt="">
                                        <div class="fw-semibold my-1">Data catalog</div>
                                        <div class="text-muted">Discover, inventory, and organize data assets</div>
                                    </div>
                                </button>
                            </div>

                            <div class="col">
                                <button type="button"
                                    class="dropdown-item text-wrap h-100 align-items-start border-end-sm border-bottom border-bottom-sm-0 rounded-bottom-start p-3">
                                    <div>
                                        <img src="../../../assets/images/demo/logos/3.svg" class="h-40px mb-2"
                                            alt="">
                                        <div class="fw-semibold my-1">Data governance</div>
                                        <div class="text-muted">The collaboration hub and data marketplace</div>
                                    </div>
                                </button>
                            </div>

                            <div class="col">
                                <button type="button"
                                    class="dropdown-item text-wrap h-100 align-items-start rounded-bottom-end p-3">
                                    <div>
                                        <img src="../../../assets/images/demo/logos/4.svg" class="h-40px mb-2"
                                            alt="">
                                        <div class="fw-semibold my-1">Data privacy</div>
                                        <div class="text-muted">Automated provisioning of non-production datasets</div>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                </li>


            </ul>

            <div class="navbar-collapse justify-content-center flex-lg-1 order-2 order-lg-1 collapse"
                id="navbar_search">
                <div class="navbar-search flex-fill position-relative mt-2 mt-lg-0 mx-lg-3">
                    <div class="form-control-feedback form-control-feedback-start flex-grow-1" data-color-theme="dark">
                        <input type="text" class="form-control bg-transparent rounded-pill" placeholder="Search"
                            data-bs-toggle="dropdown">
                        <div class="form-control-feedback-icon">
                            <i class="ph-magnifying-glass"></i>
                        </div>
                        <div class="dropdown-menu w-100" data-color-theme="light">
                            <button type="button" class="dropdown-item">
                                <div class="text-center w-32px me-3">
                                    <i class="ph-magnifying-glass"></i>
                                </div>
                                <span>Search <span class="fw-bold">"in"</span> everywhere</span>
                            </button>

                            <div class="dropdown-divider"></div>

                            <div class="dropdown-menu-scrollable-lg">
                                <div class="dropdown-header">
                                    Contacts
                                    <a href="#" class="float-end">
                                        See all
                                        <i class="ph-arrow-circle-right ms-1"></i>
                                    </a>
                                </div>

                                <div class="dropdown-item cursor-pointer">
                                    <div class="me-3">
                                        <img src="../../../assets/images/demo/users/face3.jpg"
                                            class="w-32px h-32px rounded-pill" alt="">
                                    </div>

                                    <div class="d-flex flex-column flex-grow-1">
                                        <div class="fw-semibold">Christ<mark>in</mark>e Johnson</div>
                                        <span class="fs-sm text-muted">c.johnson@awesomecorp.com</span>
                                    </div>

                                    <div class="d-inline-flex">
                                        <a href="#" class="text-body ms-2">
                                            <i class="ph-user-circle"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="dropdown-item cursor-pointer">
                                    <div class="me-3">
                                        <img src="../../../assets/images/demo/users/face24.jpg"
                                            class="w-32px h-32px rounded-pill" alt="">
                                    </div>

                                    <div class="d-flex flex-column flex-grow-1">
                                        <div class="fw-semibold">Cl<mark>in</mark>ton Sparks</div>
                                        <span class="fs-sm text-muted">c.sparks@awesomecorp.com</span>
                                    </div>

                                    <div class="d-inline-flex">
                                        <a href="#" class="text-body ms-2">
                                            <i class="ph-user-circle"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="dropdown-divider"></div>

                                <div class="dropdown-header">
                                    Clients
                                    <a href="#" class="float-end">
                                        See all
                                        <i class="ph-arrow-circle-right ms-1"></i>
                                    </a>
                                </div>

                                <div class="dropdown-item cursor-pointer">
                                    <div class="me-3">
                                        <img src="../../../assets/images/brands/adobe.svg"
                                            class="w-32px h-32px rounded-pill" alt="">
                                    </div>

                                    <div class="d-flex flex-column flex-grow-1">
                                        <div class="fw-semibold">Adobe <mark>In</mark>c.</div>
                                        <span class="fs-sm text-muted">Enterprise license</span>
                                    </div>

                                    <div class="d-inline-flex">
                                        <a href="#" class="text-body ms-2">
                                            <i class="ph-briefcase"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="dropdown-item cursor-pointer">
                                    <div class="me-3">
                                        <img src="../../../assets/images/brands/holiday-inn.svg"
                                            class="w-32px h-32px rounded-pill" alt="">
                                    </div>

                                    <div class="d-flex flex-column flex-grow-1">
                                        <div class="fw-semibold">Holiday-<mark>In</mark>n</div>
                                        <span class="fs-sm text-muted">On-premise license</span>
                                    </div>

                                    <div class="d-inline-flex">
                                        <a href="#" class="text-body ms-2">
                                            <i class="ph-briefcase"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="dropdown-item cursor-pointer">
                                    <div class="me-3">
                                        <img src="../../../assets/images/brands/ing.svg"
                                            class="w-32px h-32px rounded-pill" alt="">
                                    </div>

                                    <div class="d-flex flex-column flex-grow-1">
                                        <div class="fw-semibold"><mark>IN</mark>G Group</div>
                                        <span class="fs-sm text-muted">Perpetual license</span>
                                    </div>

                                    <div class="d-inline-flex">
                                        <a href="#" class="text-body ms-2">
                                            <i class="ph-briefcase"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="#"
                        class="navbar-nav-link align-items-center justify-content-center w-40px h-32px rounded-pill position-absolute end-0 top-50 translate-middle-y p-0 me-1"
                        data-bs-toggle="dropdown" data-bs-auto-close="outside">
                        <i class="ph-faders-horizontal"></i>
                    </a>

                    <div class="dropdown-menu w-100 p-3">
                        <div class="d-flex align-items-center mb-3">
                            <h6 class="mb-0">Search options</h6>
                            <a href="#" class="text-body rounded-pill ms-auto">
                                <i class="ph-clock-counter-clockwise"></i>
                            </a>
                        </div>

                        <div class="mb-3">
                            <label class="d-block form-label">Category</label>
                            <label class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input" checked>
                                <span class="form-check-label">Invoices</span>
                            </label>
                            <label class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input">
                                <span class="form-check-label">Files</span>
                            </label>
                            <label class="form-check form-check-inline">
                                <input type="checkbox" class="form-check-input">
                                <span class="form-check-label">Users</span>
                            </label>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Addition</label>
                            <div class="input-group">
                                <select class="form-select w-auto flex-grow-0">
                                    <option value="1" selected>has</option>
                                    <option value="2">has not</option>
                                </select>
                                <input type="text" class="form-control" placeholder="Enter the word(s)">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <div class="input-group">
                                <select class="form-select w-auto flex-grow-0">
                                    <option value="1" selected>is</option>
                                    <option value="2">is not</option>
                                </select>
                                <select class="form-select">
                                    <option value="1" selected>Active</option>
                                    <option value="2">Inactive</option>
                                    <option value="3">New</option>
                                    <option value="4">Expired</option>
                                    <option value="5">Pending</option>
                                </select>
                            </div>
                        </div>

                        <div class="d-flex">
                            <button type="button" class="btn btn-light">Reset</button>

                            <div class="ms-auto">
                                <button type="button" class="btn btn-light">Cancel</button>
                                <button type="button" class="btn btn-primary ms-2">Apply</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <!-- /main navbar -->


    <!-- Page content -->
    <div class="page-content">

        <!-- Main sidebar -->
        <div class="sidebar sidebar-dark sidebar-main sidebar-expand-lg">

            <!-- Sidebar content -->
            <div class="sidebar-content">

                <!-- Sidebar header -->
                <div class="sidebar-section">
                    <div class="sidebar-section-body d-flex justify-content-center">
                        <h5 class="sidebar-resize-hide flex-grow-1 my-auto">Navigation</h5>

                        <div>
                            <button type="button"
                                class="btn btn-flat-white btn-icon btn-sm rounded-pill border-transparent sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
                                <i class="ph-arrows-left-right"></i>
                            </button>

                            <button type="button"
                                class="btn btn-flat-white btn-icon btn-sm rounded-pill border-transparent sidebar-mobile-main-toggle d-lg-none">
                                <i class="ph-x"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /sidebar header -->


                <!-- Main navigation -->
                <div class="sidebar-section">
                    <ul class="nav nav-sidebar" data-nav-type="accordion">

                        <li class="nav-item">
                            <a href="" class="nav-link active">
                                <i class="ph-house"></i>
                                <span>
                                    Dashboard
                                </span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{ route('bangInspirationWeb') }}" class="nav-link ">
                                <i class="ph-house"></i>
                                <span>
                                    Add BangInspiration
                                </span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="" class="nav-link ">
                                <i class="ph-house"></i>
                                <span>
                                    Add BangUpdate
                                </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('bangBattleWeb') }}" class="nav-link ">
                                <i class="ph-house"></i>
                                <span>
                                    Add Bang Battle
                                </span>
                            </a>
                        </li>
                        <!-- /layout -->


                    </ul>
                </div>
                <!-- /main navigation -->

            </div>
            <!-- /sidebar content -->

        </div>
        <!-- /main sidebar -->

        @yield('content')

    </div>
</div>
