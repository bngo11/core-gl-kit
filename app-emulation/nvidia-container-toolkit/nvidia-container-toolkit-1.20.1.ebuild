# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="NVIDIA container runtime toolkit"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-toolkit"

EGO_SUM=(
	"cyphar.com/go-pathrs v0.2.5"
	"cyphar.com/go-pathrs v0.2.5/go.mod"
	"github.com/!masterminds/semver/v3 v3.5.0"
	"github.com/!masterminds/semver/v3 v3.5.0/go.mod"
	"github.com/!n!v!i!d!i!a/go-nvlib v0.12.0"
	"github.com/!n!v!i!d!i!a/go-nvlib v0.12.0/go.mod"
	"github.com/!n!v!i!d!i!a/go-nvml v0.13.4-0"
	"github.com/!n!v!i!d!i!a/go-nvml v0.13.4-0/go.mod"
	"github.com/brianvoe/gofakeit/v7 v7.12.1"
	"github.com/brianvoe/gofakeit/v7 v7.12.1/go.mod"
	"github.com/containerd/log v0.1.0"
	"github.com/containerd/log v0.1.0/go.mod"
	"github.com/containerd/nri v0.12.3"
	"github.com/containerd/nri v0.12.3/go.mod"
	"github.com/containerd/ttrpc v1.2.7"
	"github.com/containerd/ttrpc v1.2.7/go.mod"
	"github.com/cyphar/filepath-securejoin v0.7.0"
	"github.com/cyphar/filepath-securejoin v0.7.0/go.mod"
	"github.com/fsnotify/fsnotify v1.7.0"
	"github.com/fsnotify/fsnotify v1.7.0/go.mod"
	"github.com/golang/protobuf v1.5.4"
	"github.com/golang/protobuf v1.5.4/go.mod"
	"github.com/google/go-cmp v0.7.0"
	"github.com/google/go-cmp v0.7.0/go.mod"
	"github.com/google/uuid v1.6.0"
	"github.com/google/uuid v1.6.0/go.mod"
	"github.com/knqyf263/go-plugin v0.9.0"
	"github.com/knqyf263/go-plugin v0.9.0/go.mod"
	"github.com/moby/sys/devices v0.1.0"
	"github.com/moby/sys/devices v0.1.0/go.mod"
	"github.com/moby/sys/mountinfo v0.7.2"
	"github.com/moby/sys/mountinfo v0.7.2/go.mod"
	"github.com/moby/sys/reexec v0.1.0"
	"github.com/moby/sys/reexec v0.1.0/go.mod"
	"github.com/moby/sys/symlink v0.3.0"
	"github.com/moby/sys/symlink v0.3.0/go.mod"
	"github.com/opencontainers/cgroups v0.0.9"
	"github.com/opencontainers/cgroups v0.0.9/go.mod"
	"github.com/opencontainers/runc v1.5.1"
	"github.com/opencontainers/runc v1.5.1/go.mod"
	"github.com/opencontainers/runtime-spec v1.3.0"
	"github.com/opencontainers/runtime-spec v1.3.0/go.mod"
	"github.com/pelletier/go-toml v1.9.5"
	"github.com/pelletier/go-toml v1.9.5/go.mod"
	"github.com/prometheus/procfs v0.21.1"
	"github.com/prometheus/procfs v0.21.1/go.mod"
	"github.com/sirupsen/logrus v1.9.4"
	"github.com/sirupsen/logrus v1.9.4/go.mod"
	"github.com/stretchr/testify v1.12.1"
	"github.com/stretchr/testify v1.12.1/go.mod"
	"github.com/tetratelabs/wazero v1.11.0"
	"github.com/tetratelabs/wazero v1.11.0/go.mod"
	"github.com/urfave/cli-altsrc/v3 v3.1.0"
	"github.com/urfave/cli-altsrc/v3 v3.1.0/go.mod"
	"github.com/urfave/cli/v3 v3.10.1"
	"github.com/urfave/cli/v3 v3.10.1/go.mod"
	"go.yaml.in/yaml/v3 v3.0.5"
	"go.yaml.in/yaml/v3 v3.0.5/go.mod"
	"golang.org/x/mod v0.41.0"
	"golang.org/x/mod v0.41.0/go.mod"
	"golang.org/x/net v0.55.0"
	"golang.org/x/net v0.55.0/go.mod"
	"golang.org/x/sys v0.48.0"
	"golang.org/x/sys v0.48.0/go.mod"
	"golang.org/x/text v0.37.0"
	"golang.org/x/text v0.37.0/go.mod"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20260526163538-3dc84a4a5aaa"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20260526163538-3dc84a4a5aaa/go.mod"
	"google.golang.org/grpc v1.83.1"
	"google.golang.org/grpc v1.83.1/go.mod"
	"google.golang.org/protobuf v1.36.11"
	"google.golang.org/protobuf v1.36.11/go.mod"
	"tags.cncf.io/container-device-interface v1.1.1"
	"tags.cncf.io/container-device-interface v1.1.1/go.mod"
	"tags.cncf.io/container-device-interface/specs-go v1.1.1"
	"tags.cncf.io/container-device-interface/specs-go v1.1.1/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/NVIDIA/nvidia-container-toolkit/tarball/76f75c9ac2c4553d08316d08c22f563e4e57600f -> nvidia-container-toolkit-1.20.1-76f75c9.tar.gz
https://direct.funtoo.org/b4/c9/f3/b4c9f3bc509c36c4ec963585bbd6ffefbe8cc6c623349fe600e37e059233a60fd8052d0aaf45db800d2ad9c4c420cba68335066d6ac74b6bf9ad5e6ffb8fbab7 -> nvidia-container-toolkit-1.20.1-funtoo-go-bundle-a803b14ca88db7caf6e7eddef0793de12f3144323436fad1c5362a74792189e1c05d6d1bb397b4fb9aab4eb06423a71696f72208a8cf73830118003bbe5ae033.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${WORKDIR}/NVIDIA-nvidia-container-toolkit-76f75c9"

RDEPEND="app-emulation/libnvidia-container"

DEPEND="${RDEPEND}"

BDEPEND="dev-lang/go"

src_compile() {
	emake binaries || die
}

src_install() {
	dobin "nvidia-container-runtime"
	dobin "nvidia-container-runtime-hook"
	dobin "nvidia-container-runtime.cdi"
	dobin "nvidia-container-runtime.legacy"
	dobin "nvidia-ctk"
	into "/usr/bin"
	insinto "/etc/nvidia-container-runtime"
	doins "${FILESDIR}/config.toml"
}

pkg_postinst() {
	elog "Your docker service must restart after install this package."
	elog "OpenRC: sudo rc-service docker restart"
	elog "You may need to edit your /etc/nvidia-container-runtime/config.toml"
	elog "file before running ${PN} for the first time."
	elog "For details, please see the NVIDIA docker manual page."
}
